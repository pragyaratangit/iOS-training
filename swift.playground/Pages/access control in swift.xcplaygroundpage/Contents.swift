//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//Open access and public access enable entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module. You typically use open or public access when specifying the public interface to a framework.
//-> Open access applies only to classes and class members, and it differs from public access by allowing code outside the module to subclass and override

//Internal access enables entities to be used within any source file from their defining module, but not in any source file outside of that module. You typically use internal access when defining an app’s or a framework’s internal structure.

//File-private access restricts the use of an entity to its own defining source file. Use file-private access to hide the implementation details of a specific piece of functionality when those details are used within an entire file.

//Private access restricts the use of an entity to the enclosing declaration, and to extensions of that declaration that are in the same file. Use private access to hide the implementation details of a specific piece of functionality when those details are used only within a single declaration.
