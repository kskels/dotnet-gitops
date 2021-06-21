# Registry with Block Storage

https://docs.openshift.com/container-platform/4.7/registry/configuring_registry_storage/configuring-registry-storage-baremetal.html

## Create PVC

Check available storage classes and edit `pvc-registry.yaml`, create PVC

```bash
oc get storageclass
oc apply -f pvc-registry.yaml
```

# Patch registry config
oc patch configs.imageregistry.operator.openshift.io cluster \
  --type merge \
  --patch '{"spec":{"logLevel":"Normal","managementState":"Managed","storage":{"pvc":{"claim":"image-registry-storage"},"managementState":"Managed"}}}'

# Allow usage of RWO storage class
oc patch config.imageregistry.operator.openshift.io/cluster --type=merge -p '{"spec":{"rolloutStrategy":"Recreate","replicas":1}}'


# Check and potentially adjust config
oc edit configs.imageregistry.operator.openshift.io

# Verify builds
oc new-project test-builds
oc new-app golang~https://github.com/sclorg/golang-ex.git
