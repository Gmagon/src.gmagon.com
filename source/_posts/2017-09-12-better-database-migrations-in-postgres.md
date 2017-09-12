---
title: Better Database Migrations in Postgres
---

![](https://www.carnaghan.com/wp-content/uploads/2016/08/postgresql-logo.png)

As your database grows and scales there are some operations that you need to take more care of than you did when you were just starting. When working with your application in your dev environment you may not be fully aware of the cost of some operations until you run them against production. And at some point most of us have been guilty of it, running some migration that starts at 5 minutes, then 15 minutes in it’s still running, and suddenly production traffic is impacted.

There are two operations that tend to happen quite frequently, each with some straightforward approaches to mitigate having any noticable amount of downtime. Let’s look at each of the operations, how they work and then how you can approach them in a safer way.

### Adding new columns

Adding a new column is actually quite cheap in Postgres. When you do this it updates it’s underlying tracking of the columns that exist–which is almost instant. The part that becomes expensive is when you have some constraint against the column. A constraint could be a primary or foreign key, or some uniqueness constraint. Here Postgres has to scan through all the records in the table to ensure that it’s not being violated. Adding some constraint such as`not null`does happen some, but is not the most common cause.

The most common reason for slowness of adding a new column is that most frameworks make it very simple for you to set a default value for the new column. It’s one thing to do this for all new records, but when you do this when an existing table it means the database has to read all the records and re-write them with the new default value attached. This isn’t so bad for a table with a few hundred records, but for a few hundred million run it then go get yourself coffee, or lunch, or a 5 course meal because you’ll be waiting for a while.

In short,`not null`and setting a default value \(on creation\) of your new column will cause you pain. The solution is to not do those things. But, what if you want to have a default value and don’t want to allow`nulls`. There’s a few simple steps you can take, by essentially splitting your migration up from 1 step to 4 migrations:

1. Add your new column
_that allows nulls_
2. Start writing your default value on all new records and updates
3. Gradually backfill the default value
4. Apply your constraint

Yes, this is a little more work, but it doesn’t impact production in nearly the same magnitude.

### Indexes

Index creation like most DDL operations holds a lock while it’s occurring, this means any new data has to wait for the index to be created and then the new writes flow through. Again when firsting creating the table or on a small table this time is not very noticable. On a large database though, you can again wait minutes to possibly even hours._It’s a bit ironic when you think about it that adding an index to speed things up can slow things down while it’s happening._

Postgres of course has the answer for this with`CONCURRENT`index creation. What this does is gradually build up the index in the background. You can create your index concurrently with:`CREATE INDEX CONCURRENTLY`. As soon as the index is created and available as long as you did what you were hoping to Postgres will swap over to using it on queries.

### A tool to help

It’s a good practice to understand what is happening when you run a migration and its performance impact. That said you don’t have to manage this all on your own. At least for Rails there’s a tool to help enforce more of these as you’re developing to catch it earlier.[Strong migrations](https://github.com/ankane/strong_migrations) aims to catch many of these expensive operations for you to have your back, if you’re on Rails consider giving it a look.

Have other tools or tips that can help with database migrations in Postgres? [Drop me a note](https://www.twitter.com/craigkerstiens) and I’ll work to add them to the list.

Source: http://www.craigkerstiens.com/2017/09/10/better-postgres-migrations/

