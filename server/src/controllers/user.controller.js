const userModel = require('../models/user.model')
const UserService = require('../services/user.service')

const userController = {


    handleLogin: async (req, res, next) => {
        const { email, password } = req.body
        await UserService.checkEmail(email)
            .then(async (user) => {
                if (!user) {
                    throw new Error(`User don't exist`)
                }
                const isMatch = await user.comparePassword(password)
                if (isMatch === false) {
                    throw new Error(`Password invalid`)
                }
                let tokenData = { _id: user._id, name: user.name, email: user.email, image: user.image }
                const token = await UserService.generateToken(tokenData, 'secretKey', '1d')
                    { name: { $regex: req.query.search, $options: "i" } },
                    { email: { $regex: req.query.search, $options: "i" } },
                res.status(200).json({ status: true, token })
            })
            .catch(next)
    },

    handleUpdate: async (req, res, next) => {
        const _id = req.params.id
        await UserService.updateUser({ _id, ...req.body })
            .then(async (user) => {
                let tokenData = { _id: user._id, name: user.name, email: user.email, image: user.image }
                const token = await UserService.generateToken(tokenData, 'secretKey', '1d')
                res.status(200).json({ status: true, token })
            })
            .catch(next)
    },

    handleDelete: async (req, res, next) => {
        const _id = req.params.id
        await UserService.deleteUser(_id)
            .then(user => {
                res.status(200).json({
                    status: true, user
                })
            })
            .catch(next)
    },

    getAllUsers: async (req, res, next) => {
        const keyword = req.query.search
            ? {
                $or: [

                ],
            }
            : {}

        const users = await userModel
            .find(keyword)
            .find({ _id: { $ne: req.user._id } })
        res.send(users)
    }
}

module.exports = userController
