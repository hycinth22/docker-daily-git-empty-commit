# docker_push_git
docker镜像，定时向指定仓库推送空提交

通过环境变量设定参数

+ GIT_URL：仓库地址，http(s)可填写 http(s)://username:password@domain/path 的形式进行密码认证
+ GIT_EMAIL Git邮箱
+ GIT_NAME ：Git昵称
+ PRIVATE_KEY ：SSH私钥
+ CRON_TIME：推送时间，默认为 0 7 * * *
