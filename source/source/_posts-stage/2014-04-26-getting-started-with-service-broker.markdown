---
layout: post
title: "Getting Started with Service Broker"
date: 2014-04-26 18:11
comments: true
categories: 
---
In 2005 Microsoft introduced Service Broker for SQL Server. In this article well dive into it, get an overview of how it works and try it out. 

###What is Service Broker? 

Service broker helps you build loosely coupled applications that send asynchronous messages to each other. These messages are "conversations" that are persistent communications between two services. Service broker creates and maintains these conversations. 

It seems a silly comparison at first but conceptually it's like an text message conversation between two people:


{% img center /images/servicebroker/what-is-service-broker-1.jpg "What is Service Broker?" %}


I'll explain further:


