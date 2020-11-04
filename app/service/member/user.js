'use strict';

const Service = require('egg').Service;

class UserService extends Service {
  async getUser() {
    const { ctx } = this;
    try {
      const entry = await ctx.memberModel.User.findAll();
      return {
        success: true,
        user: entry,
      };
    } catch (e) {
      throw new Error(e);
    }
  }
}

module.exports = UserService;
