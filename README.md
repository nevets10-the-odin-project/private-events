# Project: Private Events

https://www.theodinproject.com/lessons/ruby-on-rails-private-events

---

## Summary 

You want to build a site similar to a private Eventbrite which allows users to create events and then manage user signups.

A user can create events. A user can attend many events. An event can be attended by many users. Events take place at a specific date and at a location (which you can just store as a string, like “Andy’s House”).

---


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