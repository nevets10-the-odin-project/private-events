# Project: Private Events

https://www.theodinproject.com/lessons/ruby-on-rails-private-events

## Introduction 

You want to build a site similar to a private Eventbrite which allows users to create events and then manage user signups.

A user can create events. A user can attend many events. An event can be attended by many users. Events take place at a specific date and at a location (which you can just store as a string, like “Andy’s House”).

This project will require you to model many-to-many relationships and also to be very conscious about your foreign keys and class names (hint: you won’t be able to just rely on Rails’ defaults like you have before).

## Post project Reflection

This project handled a lot of front-loaded information on Active Record, so it was a little difficult to do at first. I'm not sure if my years of experience with PL/SQL is making this harder; I just want to write the select statement and be done with it. Eventually, I got everything working, mostly. The hardest part was getting the join table working. It took me a long time to connect the dots in declaring the association with both the other related record (attendee and event) AND the join table itself.

Rant: Join tables shouldn't be called join tables because if I search 'join tables' all I'll get are results for sql statements. It's also not compeltely consistent - Some resources call them 'through tables' or something else.

## Pre-project DB Spec

users
    has_many :events, foreign_key: "creator_id", dependent: :destroy
    has_many :events, through: invites, foreign_key: "invitee_id"

    username: string
    password: string
    email: string
    
events
    belongs_to :creator, class_name: "User"
    has_many :users, through: invites, foreign_key: "invitee_id"

    location: string
    start: date/time

invites
    belongs_to :event
    belongs_to :invitee, class_name: "User"

    event_id
    invitee_id
    accepted: enum ["Pending", "Yes", "No"]
