# start-with-egg

## 依赖
### docker docker-compose 请自行安装

## 快速开始 Development

``` javascript
$ docker-compose up
$ open http://127.0.0.1:7001/member/member/getMember
```

### 生产环境

```bash
$ docker-compose up -d
```

#### 镜像

##### 请参考文档修改 
##### https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors

### 目录结构
```bash
egg-project
├── package.json  // 定义了项目所需要的各种模块，以及配置信息（名称、版本等元数据）
├── app.js (可选)   // 用于自定义初始化工作，这个文件只能返回一个函数beforeStart
├── agent.js (可选)  // 跟app.js类似。
├── app
|   ├── router.js  // 用于配置URL路由规则。
│   ├── controller  // 对用户的请求参数进行处理，调用对应的service方法处理业务，返回结果
│   |   └── home.js
│   ├── service (可选)  // 复杂数据的处理，第三方服务的调用。
│   |   └── user.js
│   ├── middleware (可选)  // 用于编写中间件
│   |   └── response_time.js
│   ├── schedule (可选)  // 用于编写定时任务
│   |   └── my_task.js
│   ├── public (可选)  // 存放静态资源
│   |   └── reset.css
│   ├── view (可选)  // 用于放置模板文件
│   |   └── home.tpl
│   └── extend (可选)  // 用于框架的扩展
│       ├── helper.js (可选)
│       ├── request.js (可选)
│       ├── response.js (可选)
│       ├── context.js (可选)
│       ├── application.js (可选)
│       └── agent.js (可选)
├── config   
|   ├── plugin.js  //  用于配置需要加载的插件
|   ├── config.default.js  // 默认配置文件
|   ├── config.prod.js  // 生产环境配置文件
|   ├── config.test.js (可选)
|   ├── config.local.js (可选)
|   └── config.unittest.js (可选)
└── test   //  单元测试
    ├── middleware
    |   └── response_time.test.js
    └── controller
        └── home.test.js
```

### npm 命令

- Use `npm run lint` to check code style.
- Use `npm test` to run unit test.
- Use `npm run autod` to auto detect dependencies upgrade, see [autod](https://www.npmjs.com/package/autod) for more detail.

### 注意

- 在生产环境中,你可能需要考虑使用迁移而不是在代码中调用sync()
