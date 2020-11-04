/* eslint valid-jsdoc: "off" */

'use strict';

const configDataBase = require('./mysql/config');

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1575280478097_500';

  // add your middleware config here
  config.middleware = [];

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };
  // config.sequelize = {
  //   dialect: 'mysql',
  //   host: 'mysqlserver',
  //   port: configDataBase.EGG_MYSQL_PORT,
  //   database: 'member',
  //   username: configDataBase.EGG_MYSQL_USERNAME,
  //   password: configDataBase.EGG_MYSQL_PASSWORD,
  // }
  config.sequelize = {
    datasources: [{
      delegate: 'memberModel',
      baseDir: 'model/member',
      dialect: 'mysql',
      host: 'mysqlserver',
      port: configDataBase.EGG_MYSQL_PORT,
      database: 'member',
      username: configDataBase.EGG_MYSQL_USERNAME,
      password: configDataBase.EGG_MYSQL_PASSWORD,
    }],
  };

// ,
//   {
//     delegate: 'itemsModel',
//       baseDir: 'model/items',
//     dialect: 'mysql',
//     host: 'mysqlserver',
//     port: configDataBase.EGG_MYSQL_PORT,
//     database: 'items',
//     username: configDataBase.EGG_MYSQL_USERNAME,
//     password: configDataBase.EGG_MYSQL_PASSWORD,
//   }

  return {
    ...config,
    ...userConfig,
  };
};
