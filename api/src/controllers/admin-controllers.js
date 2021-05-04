const knex = require("../database");
const JWT = require("jsonwebtoken");
const bcrypt = require("bcrypt");

const Login = async (req, res) => {
  try {
    const { username, password } = req.body;

    const admin = await knex("admin").where({ username }).select();
    const isPasswordMatch = await bcrypt.compare(password, admin[0].password);

    if (admin.length === 0 || !isPasswordMatch)
      return res
        .status(400)
        .send({ msg: "Username or Password is incorrect." });

    const token = JWT.sign(
      { username, date: new Date() },
      process.env.SECRET_KEY
    );

    await knex("admin_token").insert({
      admin_id: admin[0].admin_id,
      token,
    });

    const result = {
      username: admin[0].username,
      token,
    };

    return res.status(200).send(result);
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

const LogOut = async (req, res) => {
  try {
    const token = req.headers.authorization.replace("Bearer ", "");

    const decoded = JWT.verify(token, process.env.SECRET_KEY);
    const admin = await knex("admin")
      .where({ username: decoded.username })
      .select();

    if (admin.length === 0)
      return res.status(401).send({ msg: "Invalid Token." });

    await knex("admin_token").where({ token }).delete();

    return res.status(200).send({ msg: "Log Out Success" });
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

const SignUp = async (req, res) => {
  try {
    const { username, password } = req.body;

    const admin = {
      username,
      password: await bcrypt.hash(password, 8),
    };

    const token = JWT.sign(
      { username, date: new Date() },
      process.env.SECRET_KEY
    );

    const registeredInfo = await knex("admin").insert(admin).returning("*");
    await knex("admin_token").insert({
      admin_id: registeredInfo[0].admin_id,
      token,
    });

    const result = {
      username,
      token,
    };

    return res.status(201).send(result);
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

module.exports = {
  Login,
  LogOut,
  SignUp,
};
