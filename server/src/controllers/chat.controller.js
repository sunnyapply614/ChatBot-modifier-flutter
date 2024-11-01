const chatModel = require("../models/chat.model");
const userModel = require("../models/user.model");

const chatController = {
  accessChat: async (req, res, next) => {
    const { userId } = req.body;

    if (!userId) {
      console.log("UserId param not sent with request");
      return res.sendStatus(400);
    }



    if (isChat.length > 0) {
      res.send(isChat[0]);
    } else {
      var chatData = {
        chatName: "sender",
        isGroupChat: false,
        users: [req.user._id, userId],
      };

      try {
        const createdChat = await chatModel.create(chatData);
        const fullChat = await chatModel
          .findOne({ _id: createdChat._id })
          .populate("users", "-password");
        res.status(200).json(fullChat);
      } catch (error) {
        res.status(400);
        throw new Error(error.message);
      }
    }
  },

  fetchChats: async (req, res) => {
    try {
      chatModel
        .find({ users: { $elemMatch: { $eq: req.user._id } } })
        .populate("users", "-password")
        .populate("groupAdmin", "-password")
        .populate("latestMessage")
        .sort({ updatedAt: -1 })
        .then(async (results) => {
          results = await userModel.populate(results, {
            path: "latestMessage.sender",
            select: "name image email",
          });
          res.status(200).send(results);
        });
    } catch (error) {
      res.status(400);
      throw new Error(error.message);
    }
  },
};

module.exports = chatController;
