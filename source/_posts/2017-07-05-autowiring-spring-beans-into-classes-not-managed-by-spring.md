---
title: AutoWiring Spring Beans Into Classes Not Managed by Spring
---

In my previous article[JPA Auditing: Persisting Audit Logs Automatically using EntityListeners](https://dzone.com/articles/jpa-auditing-automatically-persisting-audit-logs), I discussed how we can use Spring Data JPA automate auditing and automatically create audit logs or history records and update CreatedBy, CreatedDate, LastModifiedBy, LastModifiedDate properties.

So in order to save history records for our File entity, we were trying to autowire EntityManager inside our FileEntityListener class before we learned that we could not do that.

We cannot inject any Spring-managed bean in the EntityListener because EntityListeners are instantiated by JPA before Spring injects anything into it. EntityListeners are not managed by Spring so Spring cannot inject any Spring-managed bean, e.g. EntityManager in the EntityListeners.

And this is not just the case with EntityListeners, you cannot autowire any Spring-managed bean into another class \(i.e. utility classes\) not managed by Spring.

Because this is a very common problem that can also arise with other classes, I tried to come out with a common solution that will not just solve this problem but will also help us get Spring-managed beans in other places.

![](http://img1.tuicool.com/zQV3IzI.png!web)

So, have created a utility class to fetch any bean according to our requirements.

```
@Service
public
class
BeanUtil
implements
ApplicationContextAware
{

    
private
static
 ApplicationContext context;

    
@Override
public
void
setApplicationContext
(ApplicationContext applicationContext)
throws
 BeansException 
{
        context = applicationContext;
    }

    
public
static
<
T
>
T 
getBean
(Class
<
T
>
 beanClass)
{
        
return
 context.getBean(beanClass);
    }

}
```

Now, to get any bean in a class, we will just need to call BeanUtil.getBean\(YourClass.class\) and pass the class type to it. Then, we will get the bean.

For example, in our case, we were trying to get the EntityManager bean inside FileEntityListener. We can simply do that by writing BeanUtil.getBean\(EntityManager.class\).

```
public
class
 FileEntityListener {

    
private
void
perform
(File target, Action action)
{
        EntityManager entityManager = BeanUtil.getBean(EntityManager.
class
);
        entityManager.persist(
new
 FileHistory(target, action));
    }

}
```

You can find the complete code in this[GitHub Repository, ](https://github.com/njnareshjoshi/articles/tree/master/spring-data-jpa-auditing)and please feel free to provide your valuable feedback.



Source: [https://dzone.com/articles/autowiring-spring-beans-into-classes-not-managed-by-spring](http://www.tuicool.com/articles/hit/zINby2B)

