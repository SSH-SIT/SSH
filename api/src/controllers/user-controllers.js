const Knex = require("../database/");
const bcrypt = require("bcrypt");

// GET Method
const getUsers = async (req, res) => {
  try {
    const users = await Knex("user")
      .fullOuterJoin("address", {
        "user.uid": "address.uid",
      })
      .select("*");

    return res.status(200).send(users);
  } catch (err) {
    return res.status(400).send({
      msg: err.message,
    });
  }
};

const getOneUsers = async (req, res) => {
  try {
    const { id } = req.params;
    const users = await Knex("user")
      .fullOuterJoin("address", {
        "user.uid": "address.uid",
      })
      .where({
        uid: id,
      })
      .select("*");
    return res.status(200).send(users);
  } catch (err) {
    return res.status(400).send({
      msg: err.message,
    });
  }
};

const Login = async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await knex("user").where({ email }).select();
    const isPasswordMatch = await bcrypt.compare(password, user[0].password);

    if (user.length === 0 || !isPasswordMatch)
      return res
        .status(400)
        .send({ msg: "Username or Password is incorrect." });

    const token = JWT.sign({ email, date: new Date() }, process.env.SECRET_KEY);

    await knex("user_token").insert({
      uid: user[0].uid,
      token,
    });

    const result = {
      uid: user[0].uid,
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
    const user = await knex("user").where({ email: decoded.email }).select();

    if (user.length === 0)
      return res.status(401).send({ msg: "Invalid Token." });

    await knex("user_token").where({ token }).delete();

    return res.status(200).send({ msg: "Log Out Success" });
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

const SignUp = async (req, res) => {
  try {
    const {
      firstName,
      lastName,
      phoneNum,
      email,
      picture,
      password,
    } = req.body;

    const token = JWT.sign({ email, date: new Date() }, process.env.SECRET_KEY);

    const registeredInfo = await Knex("user")
      .insert({
        firstName,
        lastName,
        phone_num: phoneNum,
        email,
        picture,
        password: await bcrypt.hash(password, 8),
      })
      .returning("*");
    await Knex("user_token").insert({
      uid: registeredInfo[0].uid,
      token,
    });

    const result = {
      uid: registeredInfo[0].uid,
      token,
    };

    return res.status(201).send(result);
  } catch (err) {
    return res.status(400).send({ msg: err.message });
  }
};

module.exports = {
  getUsers,
  getOneUsers,
  Login,
  LogOut,
  SignUp,
};
