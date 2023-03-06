# https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#deluser-handle

#########
# HOMEPAGE : github.com/ZarTek-Creole/tcl-fix.eggdrop.cmd
#
# Si vous aussi vous comprenez rien au commandes eggdrop;
# [bot ] commands pour bots
# [user ] commands pour user
# [put ] commands pour put
#########

####
# return preprely the list of servers with [servers]
###
proc servers {} {
  set SERVER_LIST [list]
  foreach { server_line } $::servers {
    set server_data             [split [lindex $server_line 0] :];
    set server_info             [lindex $server_line 1];
    set server_addr             [lindex $server_data 0];
    set server_port             [lindex $server_data 1];
    set server_pass             [lindex $server_data 2];
    lappend SERVER_LIST         [list $server_addr $server_port $server_pass $server_info]
  }
  return $SERVER_LIST
}
proc addserver { args } {
  # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#server-add-iphost-port-password
  server add $args
}
proc delserver { args } {
  # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#server-del-iphost-port
  server remove $args
}

proc users { } {
  userlist
}


proc put { args } {
  set cmd                       [lindex $args 0]
  set opts                      [lrange $args 1 end]
  switch -nocase $cmd {
    serv                {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#putserv-text-options
      putserv $opts
    }
    help                {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#puthelp-text-options
      puthelp $opts
    }
    quick            {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#putquick-text-options
      putquick $opts
    }
    kick            {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#putquick-text-options
      putkick  $opts
    }
    log    {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#putlog-text
      putlog $opts
    }
    default {
      return "put ?serv|help|quick|kick|log? ?opts?"
    }
  }
}
proc user { args } {
  set cmd        [lindex $args 0]
  set opts    [lrange $args 1 end]
  switch -nocase $cmd {
    count            {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#countusers
      countusers $opts
    }
    add                {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#adduser-handle-hostmask
      adduser $opts
    }
    del                {
      deluser $opts
    }
    find            {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#finduser-nickuserhost
      finduser $opts
    }
    list            {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#userlist-flags
      userlist
    }
    isvalid            {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#validuser-handle
      validuser $opts
    }
    passwdisvalid    {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#passwdok-handle-pass
      passwdok $opts
    }
    get                {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#getuser-handle-entry-type-extra-info
      getuser $opts
    }
    set                {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#setuser-handle-entry-type-extra-info
      setuser $opts
    }
    chhandle        {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#chhandle-old-handle-new-handle
      chhandle  $opts
    }
    chattr            {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#chattr-handle-changes-channel
      chattr  $opts
    }
    kick            {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#putquick-text-options
      putkick $opts
    }
    matchattr            {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#matchattr-handle-flags-channel
      matchattr $opts
    }
    default {
      return "user ?count|add|del|find|list|isvalid|passwdisvalid|get|set|chhandle|chattr|kick|matchattr? ?opts?"
    }
  }
}
# ALL USER CMD BEGIN WITH 'USER' name
proc uservalid { args } {
  # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#validuser-handle
  validuser $args
}
proc userfind { args } {
  # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#finduser-nickuserhost
  finduser $args
}
# userlist is ok
proc userpasswdisvalid { args } {
  # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#passwdok-handle-pass
  passwdok $args
}
proc userget { args } {
  # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#getuser-handle-entry-type-extra-info
  getuser $args
}
proc userset  { args } {
  # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#setuser-handle-entry-type-extra-info
  setuser $args
}
proc userchhandle { args } {
  # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#chhandle-old-handle-new-handle
  chhandle $args
}

proc userchattr { args } {
  # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#chattr-handle-changes-channel
  chattr $args
}
proc usermatchattr { args } {
  # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#matchattr-handle-flags-channel
  matchattr $args
}
proc useradd { args } {
  # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#adduser-handle-hostmask
  adduser $args
}



proc bot { args } {
  set cmd        [lindex $args 0]
  set opts    [lrange $args 1 end]
  switch -nocase $cmd {
    log    {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#putlog-text
      putlog $opts
    }
    attr            {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#botattr-handle-changes-channel
      botattr $opts
    }
    del                {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#deluser-handle
      deluser $opts
    }
    add                {
      # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#addbot-handle-address-botport-userport
      addbot $opts
    }
    default {
      return "bot ?log|attr|del? ?opts?"
    }
  }
}
# ALL BOT CMD BEGIN WITH 'BOT' name
proc delbot { args } {
  # https://github.com/eggheads/eggdrop/blob/59d1b044f2cbacf20c5f2425922a7ae3918fc9bd/doc/sphinx_source/mainDocs/tcl-commands.rst#deluser-handle
  deluser $args
}
proc botadd { args } {
  addbot $args
}
