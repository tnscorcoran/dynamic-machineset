# Populates a default AWS Machineset yaml 
### We take inputs from the user to replace placeholders for 
- [infrastructure_id]
- [instanceType]
- [availabilityZone]
- [region]
- [ami-id]

### Suggestions
Get the values as follows or use these defaults
- [infrastructure_id] - with the contents of
```
    oc get -o jsonpath='{.status.infrastructureName}{"\n"}' infrastructure cluster
```
- [instanceType]
- [availabilityZone]
- [region]
- [ami-id]