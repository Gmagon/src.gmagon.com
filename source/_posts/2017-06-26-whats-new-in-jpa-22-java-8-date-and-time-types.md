---
title: What’s new in JPA 2.2 – Java 8 Date and Time Types
---

[Follow @vlad\_mihalcea](https://twitter.com/vlad_mihalcea)

## Introduction

Now that the[JPA 2.2 Review Ballot was approved](https://www.jcp.org/en/jsr/results?id=6002), let’s start analyzing some of the new additions to the standard which have been supported by Hibernate for quite some time already.

In this article, we are going to see how Java 8 Date/Time API is supported and which types you need to use depending on your business case requirements.

## Java 8 Date/Time support

The[JPA 2.2 change log](https://jcp.org/aboutJava/communityprocess/maintenance/jsr338/ChangeLog-JPA-2.2-MR.txt)says that only[the following types are going to be supported](https://github.com/javaee/jpa-spec/issues/63):

* `java.time.LocalDate`
* `java.time.LocalTime`
* `java.time.LocalDateTime`
* `java.time.OffsetTime`
* `java.time.OffsetDateTime`

While`LocalDateTime`is rather straightforward since it only captures a point in time, similar to`java.util.Date`,[`OffsetDateTime`](https://docs.oracle.com/javase/8/docs/api/java/time/OffsetDateTime.html)is more problematic because it only captures the offset, but not the time zone rules such as DST \(Daylight Saving Time\) or other rules defined by ZoneId and typically supported by[`ZonedDateTime`](https://docs.oracle.com/javase/8/docs/api/java/time/ZonedDateTime.html).

It’s also curious that the standard does not support the[`java.time.Duration`](https://docs.oracle.com/javase/8/docs/api/java/time/Duration.html)type which can come in handy in many business use cases.

## Domain Model

Considering we have following entities in our system:

![](http://img0.tuicool.com/yEBFvmm.png!web)

The`Employee`entity contains the following Java 8 Date Time attributes:

* `birthday`
  attribute is a
  `LocalDate`
  since we are only interested in the Date part
* `updatedOn`
  is a
  `LocalDateTime`
  since this attribute needs to store both Date and Time information

```
@Entity
(name = 
"Employee"
)
public class Employee {

    
@Id
@GeneratedValue

    private Long id;

    
@NaturalId

    private String name;

    
private
LocalDate
birthday
;

    @
Column
(name = 
"updated_on"
)
    
private
LocalDateTime
updatedOn
;

    
//Getters are setters omitted for brevity

}
```

The`Meeting`entity features the following Java 8 Date Time attributes:

* `startsAt`
  is a
  `ZoneDateTime`
  which, even if not supported by JPA 2.2, is probably a more suitable version of
  `OffsetDateTime`
* the
  `duration`
  attribute might not be supported by JPA 2.2, but we will use it since Hibernate supports all these types

```
@Entity
(name = 
"Meeting"
)
public class Meeting {

    
@Id

    private Long id;

    
@ManyToOne
(fetch = FetchType.LAZY)
    
@JoinColumn
(name = 
"employee_id"
)
    private Employee createdBy;

    
@Column
(name = 
"starts_at"
)
    private ZonedDateTime startsAt;

    
private
Duration
duration
;
    
    
//Getters are setters omitted for brevity

}
```

## Testing time

Assuming we persist the following entities:

```
Employee employee = 
new
 Employee();
employee.setName( 
"Vlad Mihalcea"
 );
employee.setBirthday(
    LocalDate.
of
(
        
1981
, 
12
, 
10

    )
);
employee.setUpdatedOn(
    LocalDateTime.
of
(
        
2015
, 
12
, 
1
,
        
8
, 
0
, 
0

    )
);

entityManager.persist( employee );

Meeting meeting = 
new
 Meeting();
meeting.setId( 
1
L );
meeting.setCreatedBy( employee );
meeting.setStartsAt(
    ZonedDateTime.
of
(
        
2017
, 
6
, 
25
,
        
11
, 
30
, 
0
, 
0
,
        ZoneId.systemDefault()
    )
);
meeting.setDuration(
    Duration.
of
( 
45
, ChronoUnit.MINUTES )
);

entityManager.persist( meeting );
```

Hibernate is going to generate the following SQL statements:

```
INSERT
INTO
 Employee (
    birthday, 
    
name
, 
    updated_on, 
    
id

) 

VALUES
 (
    
'1981-12-10'
, 
    
'Vlad Mihalcea'
, 
    
'2015-12-01 08:00:00.0'
, 
    
1

)


INSERT
INTO
 Meeting (
    employee_id, 
    
duration
, 
    starts_at, 
    
id

) 

VALUES
 (
    
1
, 
    
2700000000000
, 
    
'2017-06-25 11:30:00.0'
, 
    
1

)
```

Both`LocalDateTime`and`ZonedDateTime`share the`org.hibernate.type.descriptor.sql.TimestampTypeDescriptor`, meaning that they are going to be persisted as`java.sql.Timestamp`.

While for`LocalDateTime`it makes no difference since, just like`java.sql.Timestamp`, it only captures a time snapshot, the`ZonedDateTime`is going to lose the zone information.

When loading back our entities:

```
Employee employee = entityManager
.unwrap( Session.
class
 )
.bySimpleNaturalId( Employee.
class
 )
.load( 
"Vlad Mihalcea"
 );

assertEquals(
    LocalDate.
of
(
        
1981
, 
12
, 
10

    ),
    employee.getBirthday()
);
assertEquals(
    LocalDateTime.
of
(
        
2015
, 
12
, 
1
,
        
8
, 
0
, 
0

    ),
    employee.getUpdatedOn()
);

Meeting meeting = entityManager.find( Meeting.
class
, 
1
L );
assertSame(
    employee, meeting.getCreatedBy()
);
assertEquals(
    ZonedDateTime.
of
(
        
2017
, 
6
, 
25
,
        
11
, 
30
, 
0
, 
0
,
        ZoneId.systemDefault()
    ),
    meeting.getStartsAt()
);
assertEquals(
    Duration.
of
( 
45
, ChronoUnit.MINUTES ),
    meeting.getDuration()
);
```

The original Java 8 Data Time objects match the ones being persisted.

If you enjoyed this article, I bet you are going to love[my book](https://leanpub.com/high-performance-java-persistence?utm_source=blog&utm_medium=banner&utm_campaign=article)as well.

![](http://img0.tuicool.com/YbQ7ziI.jpg!web)

## Conclusion

The reason why`ZonedDateTime`equals the one we previously saved is because the undnerlying`TIMESTAMP`value was transposed in the current System Time Zone.

Until all JDBC Drivers will support`TIMESTAMP WITH TIMEZONE`at the`java.sql.Statement`paraeter value binding level which is a requirement for[HHH-11773](http://hibernate%20https//hibernate.atlassian.net/browse/HHH-11773), it’s doubtful that you really need to use`ZonedDateTime`or`OffsetDateTime`.

Currently, it’s much wiser to save all`TIMESTAMP`values inUTC, meaning that`LocalDateTime`is a much better fit for your JPA entities.

If you liked this article, you might want to subscribe to[my newsletter](http://eepurl.com/bg3d3n) too.



Source: [https://vladmihalcea.com/2017/06/26/whats-new-in-jpa-2-2-java-8-date-and-time-types/](http://www.tuicool.com/articles/hit/UVF3Mzy)

