---
title: How the Saga Pattern manages failures with AWS Lambda and Step Functions
---


# How the Saga Pattern manages failures with AWS Lambda and Step Functions

In the world of microservices it’s important to ensure data consistency is maintained across distributed transactions

![](http://img1.tuicool.com/AZnm633.png!web)

In Hector Garcia-Molina’s[1987 paper “_Sagas_](http://www.cs.cornell.edu/andru/cs711/2002fa/reading/sagas.pdf)_”_, he described an approach for solving system failures in a long-running database transactions.

Hector described a Saga as a sequence of related small transactions. In a Saga, the coordinator \(database in their case\) makes sure that all of the involved transactions are successfully completed. Otherwise, if the transactions fails the coordinator runs compensating transactions to amend the partial execution.

This approach is increasingly relevant in the world of microservices as application logic often needs to transact across multiple bounded contexts — each encapsulated by its own microservice with independent databases.

[Caitie McCaffrey](https://twitter.com/caitie)recently shared a great presentation that summarizes her experience using the Saga pattern in distributed systems.

During the presentation, Caitie uses the following example set of related transactions — or Saga — to illustrate the pattern.

```
Begin transaction
Start book hotel request
End book hotel request
Start book flight request
End book flight request
Start book car rental request
End book car rental request
End transaction
```

We can use a Lambda function to model each of the actions — and their compensating actions — and use a state machine in Step Function as the**coordinator**for the saga.

![](http://img2.tuicool.com/n6Nfieu.png!web)

Each action and compensating action are modelled as a Lambda function.

Since the compensating actions can also fail, we need to be able to retry them until success — which means they have to be**idempotent**. We’ll also implement**backward recovery**in the event of a system failure.

Below is the state machine that represents our saga. Each of the actions — BookHotel, BookFlight and BookRental — have a compensating action and will be performed in order. The recursive arrows represent that the compensating actions are retried until successful.

![](http://img0.tuicool.com/fYVvEni.png!web)

Each Lambda function expects the input to be in the following shape:

```
{
"trip_id": "5c12d94a-ee6a-40d9-889b-1d49142248b7",
"depart": "London",
"depart_at": "2017-07-10T06:00:00.000Z",
"arrive": "Dublin",
"arrive_at": "2017-07-12T08:00:00.000Z",
"hotel": "holiday inn",
"check_in": "2017-07-10T12:00:00.000Z",
"check_out": "2017-07-12T14:00:00.000Z",
"rental": "Volvo",
"rental_from": "2017-07-10T00:00:00.000Z",
"rental_to": "2017-07-12T00:00:00.000Z"
}
```

Inside each of the functions is a simple`PutItem`request against a different DynamoDB table. The corresponding compensating function will perform a`DeleteItem`against the corresponding table to rollback the`PutItem`action.

The state machine pass the same input to each action in turn \(Book Hotel → BookFlight → Book Rental\) and record their results at a specific path. This will avoid overriding the input`$`that will be passed to the next function.

In this naive implementation, we’ll apply the compensating action for any failure — hence the`State.ALL`below. In practice, you should consider giving certain error types a[retry](http://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-errors.html#amazon-states-language-retrying-after-error)— e.g. temporal errors such as DynamoDB’s provision throughput exceeded exceptions.

The output and error from each action and compensating action are stored at a specific path. This will avoid overriding the input value`$`for the rest of the actions.

![](http://img0.tuicool.com/6Rfqymb.png!web)

#### The Happy Path Flow

Following the happy path, each of the actions are performed in turn and the state machine will successfully complete.

![](http://img0.tuicool.com/36jEz2J.png!web)

#### Failure Cases

When failures strike, we need to apply the corresponding compensating actions in turn depending on where the failure occurs.

In the examples below, if the failure happened at`BookFlight`, then both`CancelFlight`and`CancelHotel`will be executed to rollback any changes performed thus far.

Similar, if the failure happened at`BookRental`, then all three compensating actions —`CancelRental`,`CancelFlight`and`CancelHotel`— will be executed in that order to rollback all the state changes from the transaction.

Each compensating action also have an infinite retry loop! In practice, there should be a reasonable upper limit on the no. of retries before you alert for human intervention.

![](http://img1.tuicool.com/Jr677be.png!web)

If you’d like to experiment on your own with the Saga Pattern using this example, the source code for this demo can be found[here](https://github.com/theburningmonk/lambda-saga-pattern).

[theburningmonk/lambda-saga-pattern_lambda-saga-pattern - Implementing the Saga pattern for Lambda functions using Step Functions_github.com](https://github.com/theburningmonk/lambda-saga-pattern)

I’d be interested in your thoughts on the benefits or drawbacks of using the Saga Pattern with microservices architecture … please drop a comment below._Thanks for reading!_



Source:  https://read.acloud.guru/how-the-saga-pattern-manages-failures-with-aws-lambda-and-step-functions-bc8f7129f900?gi=1f27b350ff64