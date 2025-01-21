In Objective-C, a common yet subtle error arises when dealing with `NSManagedObjectContext` and its interaction with threads.  Specifically, attempting to access or modify a managed object context from a thread other than the one it was created on can lead to crashes or unpredictable behavior. This is because Core Data's internal mechanisms aren't thread-safe.

```objectivec
// Incorrect - Accessing the context from a background thread
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{    
    [managedObjectContext save:nil]; // This will likely crash
});
```