tkn pipeline start dotnet-build-and-deploy \
    -w name=shared-workspace,volumeClaimTemplateFile=pvc-source.yaml \
    -p deployment-name=aspnet-core-app \
    -p git-url=https://github.com/kskels/azure-cache-redis-samples.git \
    -p IMAGE=image-registry.openshift-image-registry.svc:5000/dotnet-cicd/aspnet-core-app
