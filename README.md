# Tekton Pipelines

```bash
oc new-project dotnet-dev
oc new-project dotnet-prod
oc new-project dotnet-cicd

oc apply -f roles/
oc apply -f tasks/

oc apply -f pipelines/pipeline-dotnet-build.yaml

oc apply -f secrets/
oc patcoh sa pipeline --patch-file secrets/serviceaccount-pipeline-patch.yaml
```
