# Populates a default AWS Machineset yaml 
### We take inputs from the user to replace various placeholders  
You need to establish the values as follows or use these defaults
- infrastructure_id - with the contents of:
```
    oc get -o jsonpath='{.status.infrastructureName}{"\n"}' infrastructure cluster
```
- instanceType - your desired Amazon instance type e.g. g5.8xlarge
- region - e.g. eu-central-1
- availabilityZone - e.g. eu-central-1a (make this the same availabilityZone as an existing machineset)
- ami-id - You will need to get this - (make this the same ami as appears in an existing machineset)


### Steps
 -  Login to OpenShift
    ```
    oc login ----
    ```
 -  Next we'll run commands to 
    - Get your OpenShift cluster id
    - Do your placeholder replacements
    - Set your OpenShift project
    - Create your machineset

    Run the following - replacing what's in quotes with your values, where needed
    ```
    export CLUSTER_ID=$(oc get -o jsonpath='{.status.infrastructureName}{"\n"}' infrastructure cluster)
    sh ./dynamic-machineset.sh dynamic-machineset.yaml $CLUSTER_ID 'g5.8xlarge' 'eu-central-1' 'eu-central-1c' 'ami-123456789'
    oc project openshift-machine-api
    oc apply -f dynamic-machineset.yaml
    ```    

Modify both the ***Security Groups*** and ***Subnet*** sections of the yaml - substituting in ID values from an existing running Machineset on the cluster
e.g.

```
          securityGroups:
            - filters:
                - name: 'tag:Name'
                  values:
                    - cluster-ggvz5-wjp8w-node
            - filters:
                - name: 'tag:Name'
                  values:
                    - cluster-ggvz5-wjp8w-lb
```
and
```
          subnet:
            filters:
              - name: 'tag:Name'
                values:
                  - cluster-ggvz5-wjp8w-subnet-private-eu-west-1a
```