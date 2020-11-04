'use strict';

const Controller = require('egg').Controller;

class UserController extends Controller {
  async getUser() {
    const { ctx, service } = this;
    const params = ctx.query;
    const userList = await service.member.user.getUser();
    ctx.body = {
      test: 1,
      success: true,
      data: userList,
    };
    // const { ctx } = this;
    // const userList = [{}, {}]
    // ctx.body = {
    //   success: true,
    //   data: userList,
    // };
  }
}

module.exports = UserController;
