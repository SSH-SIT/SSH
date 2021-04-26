const knex = require("../database");
const JWT = require("jsonwebtoken");
const bcrypt = require("bcrypt");

const Login = async (req, res) => {
  try {
    const { username, password } = req.body;

    const admin = await knex("Admin").where({ username }).select();
    const isPasswordMatch = await bcrypt.compare(password, admin[0].password);

    if (admin.length === 0 || !isPasswordMatch)
      return res
        .status(400)
        .send({ msg: "Username or Password is incorrect." });

    const token = JWT.sign(
      { username, date: new Date() },
      process.env.SECRET_KEY
    );

    await knex("Admin_Token").insert({
      admin_id: admin[0].id,
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
    const admin = await knex("Admin")
      .where({ username: decoded.username })
      .select();

    if (admin.length === 0)
      return res.status(401).send({ msg: "Invalid Token." });

    await knex("Admin_Token").where({ token }).delete();

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

    const registeredInfo = await knex("Admin").insert(admin).returning("*");
    await knex("Admin_Token").insert({
      admin_id: registeredInfo[0].id,
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
