To fix this, you need to perform Core Data operations on the main thread using Grand Central Dispatch (GCD) or operations. Here's the corrected code:

```objectivec
// Correct - Use GCD to perform operations on the main thread
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{    
    NSManagedObjectContext *privateContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [privateContext performBlock:^{ 
        [privateContext save:nil];
        dispatch_async(dispatch_get_main_queue(), ^{            
          [managedObjectContext save:nil]; // Save to main context
        });
    }];
});
```

Alternatively, using `NSPersistentStoreCoordinator`'s `performBlock:` method can streamline the process, encapsulating the save operation within a thread-safe block.

Remember that creating and using a private context for background operations is a best practice. It prevents unintended modifications to the main context and improves performance.