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
 - 
    ```
    oc login ----
    ```
 - xs