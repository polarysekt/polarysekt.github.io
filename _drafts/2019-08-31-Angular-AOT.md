---
layout: post
title: Angular AOT Notes
description: "Notes about Angular and AOT compiling"
modified: 2019-03-10
tags: [angular, aot]
---

# Angular AOT

## Caveats

>>> "Error encountered resolving symbol values statically. Function calls are not supported.
>>> Consider replacing the function or lambda with a reference to an exported function"

``` javascript
  provide: MyService,
  useFactory: () => new MyService()
```

``` javascript
export function myServiceFactory() {
  return new MyService();
}@NgModule({
  providers: [
    {
      provide: MyService,
      useFactory: myServiceFactory
    }
  ]
})
export class MyServiceModule {}

```