<template>
  <header class="header">
    <a href="/" class="header-logo"><%= render 'layouts/logo' %></a>
    <ul class="header-nav">
      <% if logged_in? %>
      <li><%= link_to "Sign out", logout_path, method: :delete %>
      <% end %>
    </ul>
  </header>





  <div class="message">
    <div class="message-user">
      <%= message.user.username %>:
    </div>
    <div class="message-content">
      <%= message.content %>
    </div>
  </div>

  <div id="messages" class="messages">
    <div id="messages-table" class="messages-table">
      <% if @messages.any? %>
        <%= render @messages %>
      <% end %>
    </div>
  </div>


  <div class="message-input">
    <%= form_for(@message, remote: true) do |f| %>
      <%= f.text_area :content %>
      <%= f.submit "Send" %>
    <% end %>
  </div>


</template>