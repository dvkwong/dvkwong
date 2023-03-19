---
title: Azure Functions
categories:
  - posts
tags:
  - Azure  
---

### Resources

* [Managing Azure Function Keys](https://markheath.net/post/managing-azure-function-keys)
* [Csx functions](https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/azure-functions/functions-reference-csharp.md#folder-structure)
* [Azure function tools](https://www.npmjs.com/package/azure-functions-core-tools) npm package for running and creating functions locally
* [Azure functions pack](https://github.com/Azure/azure-functions-pack)
* [How to Develop & Debug functions locally](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local) using VS Code or Studio
* [Azure Cosmos DB Emulator (free)](https://aka.ms/documentdb-emulator) installs on [port 8081](https://localhost:8081/_explorer/index.html)
* [Durable functions long running](https://medium.com/@ThisisZone/azure-durable-functions-before-and-after-b7266d51ed4d)

### OpenApi

[Microsoft/OpenAPI.NET](https://github.com/microsoft/openapi.net/)

### Installing preview versions

1. Find release name eg [2.4.249](https://github.com/Azure/azure-functions-core-tools/releases)
2. Use npm tool to install specific version eg 'npm install -g azure-functions-core-tools@2.4.249'