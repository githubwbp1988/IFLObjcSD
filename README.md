# IFLObjcSD

# 如果想自己执行配置过程，可下载干净源码按照以下步骤配置 

想了解更多，可通过 [主站](https://juejin.cn/user/1838800346293336) 进一步查看

# 首先编译target objc

1. unable to find sdk 'macosx.internal'
> ![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/fbba2b6043ec459fa07d1c75dbc7128b~tplv-k3u1fbpfcp-watermark.image?)

-  `PROJECTS` –> `objc` –> `Build Settings`, 将 `Base SDK` 改成 `macOS`
-  `TARGETS` –> `objc` –> `Build Settings`, 将 `Base SDK` 改成 `macOS`

2. 'sys/reson.h' file not found
> ![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/f68bb147fc5a415bbcf25d6e79ceb6e0~tplv-k3u1fbpfcp-watermark.image?)

- 下载xnu-8020.101.4, 把 `xnu-8020.101.4/bsd/sys/reason.h` 文件复制到 `comm_ifl/sys` 目录下
> ![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b2fbe3743d194f3999fb7dfc650a32b9~tplv-k3u1fbpfcp-watermark.image?)
- 设置头文件搜索路径：`TARGETS` –> `objc` –> `Build Settings` –> `Header Search Paths`, 添加一条 `$(SRCROOT)/comm_ifl`
> ![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/9f0851cae0b44d78956de0070d2793cb~tplv-k3u1fbpfcp-watermark.image?)

3. 'mach-o/dyld_priv.h' file not found
> ![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/1deb84c54e9a49dcbf0d4bf5b9237777~tplv-k3u1fbpfcp-watermark.image?)

- 下载 dyld-955, 把 `dyld-955/include/mach-o/dyld_priv.h` 拷贝到 `comm_ifl/mach-o/dyld_priv.h`
> ![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/bd8c26cc7af14ab0baf767f93a228e75~tplv-k3u1fbpfcp-watermark.image?)

4. 'os/lock_private.h' file not found
> ![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/9b2de696392541d5822bdd2b08543e59~tplv-k3u1fbpfcp-watermark.image?)

- 下载 libplatform-273.100.5， 把 `libplatform-273.100.5/private/os/lock_private.h` 拷贝到 `comm_ifl/os/lock_private.h`
> ![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/c658abfa97194ecd90d9bd5756a2ba38~tplv-k3u1fbpfcp-watermark.image?)

5. **extern** dyld_platform_t dyld_get_active_platform(**void**) __API_AVAILABLE(macos(10.14), ios(12.0), watchos(5.0), tvos(12.0), bridgeos(3.0));  ---- 报错 Expected ','
> ![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/d6318dee323f454e9cacfeea15d9d69c~tplv-k3u1fbpfcp-watermark.image?)

- 由于调试主要基于macos，删除`, bridgeos(3.0)`

6. 同5
> ![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/eae20646586e485f9cd97b45fae639a6~tplv-k3u1fbpfcp-watermark.image?)

- 同样均删除掉 `, bridgeos(3.0)`

7. 'os/base_private.h' file not found
> ![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/3fa63b2659484b068e9ab0e734482560~tplv-k3u1fbpfcp-watermark.image?)

- 下载源码（macOS Catalina 10.15 - macOS 10.15.6）libplatform-220.100.1, 把 `libplatform-220.100.1/private/os/base_private` 拷贝到 `comm_ifl/os/base_private.h`
> ![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/041f45182b60419e8ed504374d91fbcb~tplv-k3u1fbpfcp-watermark.image?)

8. 'pthread/tsd_private.h' file not found

- 下载 libpthread-libpthread-486.100.11 `libpthread-libpthread-486.100.11/private/pthread/tsd_private.h` 拷贝到 `comm_ifl/pthread/tsd_private.h`

9. 'System/machine/cpu_capabilities.h' file not found

- `xnu-xnu-8020.101.4/osfmk/machine/cpu_capabilities.h` 拷贝到 `comm_ifl/System/machine/cpu_capabilities.h`

10. 'os/feature_private.h' file not found
- 注释掉

11. 'os/variant_private.h' file not found
- google搜索 os/variant_private.h opensource.apple.com
    
  得到结果 https://opensource.apple.com/source/Libc/Libc-1244.50.9/os/variant_private.h.auto.html 根据路径找文件
  
- 拷贝 `Libc-Libc-1507.100.9/os/variant_private.h` 至 `comm_ifl/os/variant_private.h`

12. 'os/tsd.h' file not found

- 拷贝 `xnu-xnu-8020.101.4/libsyscall/os/tsd.h` 至 `comm_ifl/os/tsd.h`

13. 'pthread/spinlock_private.h' file not found

- 拷贝 `libpthread-libpthread-486.100.11/private/pthread/spinlock_private.h` 至 `comm_ifl/pthread/spinlock_private.h`

14. 'System/pthread_machdep.h' file not found

- 拷贝 `Libc-825.24/pthreads/pthread_machdep.h` 至 `comm_ifl/System/pthread_machdep.h`

15. bridgeos(4.0) 问题

- 去除
> ![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e3267edbcc5446268f4aaf25f57767e5~tplv-k3u1fbpfcp-watermark.image?)

16. 'CrashReporterClient.h' file not found

- 拷贝 `Libc-825.24/include/CrashReporterClient.h` 至 `comm_ifl/CrashReporterClient.h`

17. Typedef redefinition with different types ('int' vs 'volatile OSSpinLock' (aka 'volatile int'))

> ![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/84abc8e3a58d47da8bb8fc3364b7903c~tplv-k3u1fbpfcp-watermark.image?)

- 注释掉

> ![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/d0aa9cdb5da54c849741ca9c85a56f5f~tplv-k3u1fbpfcp-watermark.image?)
> ![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/c2880f00cda34c918f42bf1c527588d5~tplv-k3u1fbpfcp-watermark.image?)

18. Use of undeclared identifier 'dyld_platform_version_macOS_10_13'
> 

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/bec9c0ed711346deb73aedaa16a495e0~tplv-k3u1fbpfcp-watermark.image?)

- 注释

> ![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/9fa2dde48f7447a7bf7cc656f0b25d20~tplv-k3u1fbpfcp-watermark.image?)

19. 'os/bsd.h' file not found

- 注释

20. 'os/reason_private.h' file not found

- 拷贝 `xnu-xnu-8020.101.4/libkern/os/reason_private.h` 至 `comm_ifl/os/reason_private.h`

21. 'objc-shared-cache.h' file not found

- 拷贝 `dyld-dyld-955/include/objc-shared-cache.h` 至 `comm_ifl/objc-shared-cache.h`

22. 'os/linker_set.h' file not found

- 拷贝 `Libc-Libc-1507.100.9/os/linker_set.h` 至 `comm_ifl/os/linker_set.h`

23. '_simple.h' file not found
- 拷贝 `Libc-825.24/gen/_simple.h` 至 `comm_ifl/_simple.h`

24. dyld_program_sdk_at_least(dyld_fall_2020_os_versions)
> ![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/d003780cbec6417fac820cf8a61d612d~tplv-k3u1fbpfcp-watermark.image?)

- 注释掉

> ![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b50a695813fe4405a7bbd5bfbb9311c6~tplv-k3u1fbpfcp-watermark.image?)

25. Use of undeclared identifier 'objc4'

- 注释掉

26. Use of undeclared identifier 'CRGetCrashLogMessage'

> ![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e63b6491e0e643549a9e61d97d8825b3~tplv-k3u1fbpfcp-watermark.image?)
> ![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b0aa38dfe7ae48bbb4cfa8b428e504cc~tplv-k3u1fbpfcp-watermark.image?)

27. 'Cambria/Traps.h  Cambria/Cambria.h' file not found
- 注释

28. 'kern/restartable.h' file not found

- `xnu-xnu-8020.101.4/osfmk/kern/restartable.h` 拷贝到 `comm_ifl/kern/restartable.h`

29. Use of undeclared identifier 'oah_is_current_process_translated'

> ![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/daebf794bec442d78db667f33638cede~tplv-k3u1fbpfcp-watermark.image?)
> ![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/646b0546ebb24d92ba0f682b055ff9da~tplv-k3u1fbpfcp-watermark.image?)

30. Block_private.h
- `libclosure-libclosure-79.1/Block_private.h` 拷贝到 `comm_ifl/Block_private.h`

31. Use of undeclared identifier 'os_parse_boot_arg_string'
- 注释掉
> ![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/08e94f635f534147851a4fc12b874442~tplv-k3u1fbpfcp-watermark.image?)

32. Use of undeclared identifier 'dyld_platform_version_macOS_10_11'

> ![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/d439c029c6c44dbd928dbb615aeaf3e2~tplv-k3u1fbpfcp-watermark.image?)
> ![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/a3f6852f9e514fc3a8aafb18661bd65d~tplv-k3u1fbpfcp-watermark.image?)

33. Use of undeclared identifier 'dyld_fall_2018_os_versions'
- 注释掉

> ![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/3d556f93671149f9957edab99d33c075~tplv-k3u1fbpfcp-watermark.image?)


34. Use of undeclared identifier 'dyld_platform_version_macOS_10_12'
> ![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/d8f57327678f47fbb0955bc11a9284f0~tplv-k3u1fbpfcp-watermark.image?)
> ![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/6f57059ad8b74bf491e040cd902de3e3~tplv-k3u1fbpfcp-watermark.image?)

35. '_static_assert' declared as an array with a negative size
> ![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/2499cdacabc547dbbff824afe20bf970~tplv-k3u1fbpfcp-watermark.image?)
- 注释

# 在 `dyld_priv.h` 文件顶部加入宏

    #define DYLD_MACOSX_VERSION_10_11 0x000A0B00
    #define DYLD_MACOSX_VERSION_10_12 0x000A0C00
    #define DYLD_MACOSX_VERSION_10_13 0x000A0D00
    #define DYLD_MACOSX_VERSION_10_14 0x000A0E00



# CrashReporterClient异常

CrashReporterClient.h已经导入，还是报错 找不到


# 配置脚本


![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/42419913789c411c8e6eb6175bc1bc75~tplv-k3u1fbpfcp-watermark.image?)




![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/199de25a529d43f5a3f900b5d61d16ba~tplv-k3u1fbpfcp-watermark.image?)



![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e2af12f4ea2c4e4981d7148cc1c43397~tplv-k3u1fbpfcp-watermark.image?)


# ld -loah报错

![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/3a03224135564fd0b6bc5617d593213a~tplv-k3u1fbpfcp-watermark.image?)

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/baa79ad4d4b04d3788a5390b2efe8931~tplv-k3u1fbpfcp-watermark.image?)

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/d715d437f9004137b91eec25446a1892~tplv-k3u1fbpfcp-watermark.image?)

# objc编译成功


![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/d4026322e89c43a3bfa996541c5411b5~tplv-k3u1fbpfcp-watermark.image?)


# 接下来objc进行编译调试

- 新建target

![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/c474eed1370e4d2cbf7822f349be4d3c~tplv-k3u1fbpfcp-watermark.image?)

- 建立依赖


![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/a664b58aef624869a1ae18b25b8378b5~tplv-k3u1fbpfcp-watermark.image?)

![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/084f7184b32a4aa69c506fa0649b60f8~tplv-k3u1fbpfcp-watermark.image?)

# 编译调试target


![image.png](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/8a5fd5fa8a144162a91ec29867308a6e~tplv-k3u1fbpfcp-watermark.image?)

- 下符号 alloc调试

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/7b97d82bcc3e447395d47cbec2ff94fc~tplv-k3u1fbpfcp-watermark.image?)

进入源码 alloc 

坚持到这一步，M1 objc调试环境OK，就恭喜了


想了解更多，可通过 [主站](https://juejin.cn/user/1838800346293336) 进一步查看
