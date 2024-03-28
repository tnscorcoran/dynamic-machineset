# Populates a default AWS Machineset yaml 
### We take inputs from the user to replace placeholders for 
- [infrastructure_id]
- [instanceType]
- [availabilityZone]
- [region]
- [ami-id]

### Data Input Suggestions
Get the values as follows or use these defaults
- [infrastructure_id] - with the contents of:
```
    oc get -o jsonpath='{.status.infrastructureName}{"\n"}' infrastructure cluster
```
- [instanceType] - e.g. s
- [region] - e.g. eu-central-1
- [availabilityZone] - e.g. eu-central-1a (make this the same availabilityZone as an existing machineset)
- [ami-id] - (make this the same amiid as appears in an existing machineset)


### Steps
 -  Login to OpenShift
    ```
    oc login ----
    ```
 -  Next we'll run commeands to 
    - Get your OpenShift cluster id
    - Do your placeholder replacements
    - Set your OpenShift project
    - Create your machineset

    Run the following - replacing what's in quotes with your values, where needed
    ```
    export CLUSTER_ID=$(oc get -o jsonpath='{.status.infrastructureName}{"\n"}' infrastructure cluster)
    sh ./dynamic-machineset.sh dynamic-machineset.yaml $CLUSTER_ID 'g5.8xlarge' 'eu-central-1' 'eu-central-1c' 'ami-04dfa611b3daffc47'
    oc project openshift-machine-api
    oc apply -f dynamic-machineset.yaml
    ```    