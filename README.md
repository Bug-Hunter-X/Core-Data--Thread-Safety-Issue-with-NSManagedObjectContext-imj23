# Objective-C Core Data Thread Safety Bug

This repository demonstrates a common error in Objective-C Core Data programming: accessing an `NSManagedObjectContext` from an incorrect thread.  Attempting to interact with the context from a thread other than the one it was created on can lead to crashes or data corruption.

The `bug.m` file showcases the problematic code. The `bugSolution.m` file presents the correct approach, utilizing appropriate concurrency mechanisms to avoid thread safety issues.

## Problem
The problem lies in directly accessing the `NSManagedObjectContext` from a background thread without proper synchronization. Core Data's internal structures are not thread-safe, resulting in undefined behavior.