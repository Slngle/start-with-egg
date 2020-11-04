'use strict';

module.exports = app => {
  const { DATE, STRING, UUID, BIGINT } = app.Sequelize;
  return app.memberModel.define('user', {
    id: {
      type: UUID,
      primaryKey: true,
      allowNull: false,
    },
    user_name: STRING(64),
    mobile: STRING(11),
    password: STRING(255),
    union_id: STRING(64),
    open_id: STRING(64),
    head_portrait: STRING(255),
    birthday: DATE,
    address: STRING(64),
    area: STRING(32),
    city: STRING(32),
    province: STRING(32),
    gender: BIGINT(8),
    user_type: BIGINT(8),
    status: BIGINT(8),
    age: BIGINT(11),
    created_at: DATE,
    updated_at: DATE,
  }, {
    freezeTableName: true,
    tableName: 'user',
    underscored: true,
  });
};
