'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  // if (app.config.env === 'local' || app.config.env === 'unittest') {
  //   app.beforeStart(async () => {
  //     await app.memberModel.sync({ alter: true });
  //   });
  // }
  router.get('/member/member/getMember', controller.member.user.getUser);

};
