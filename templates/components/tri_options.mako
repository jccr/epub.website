<%!
    key_ = "options"
%>
<%block name="layout">
    <style>
        .epw-${self.attr.key_}-radio {
            position: absolute;
            appearance: none;
            width: 2.5em;
            height: 3em;
            background: red;
        }

        .epw-${self.attr.key_}-minus {
            top: 0em;
            left: 0.5em;
            background: blue;
        }

        .epw-${self.attr.key_}-plus {
            top: 0em;
            left: 5.5em;
            background: red;
        }

        .epw-${self.attr.key_}-default {
            height: 3em;
            width: 7.5em;
            background: green;
        }
    </style>
</%block>
<style>
  #epw-${self.attr.key_}1 {
    z-index: 104;
  }

  #epw-${self.attr.key_}2 {
    z-index: 103;
  }

  #epw-${self.attr.key_}3 {
    z-index: 102;
  }

  #epw-${self.attr.key_}4 {
    z-index: 101;
  }

  #epw-${self.attr.key_}1:checked {
    z-index: 101;
  }

  #epw-${self.attr.key_}2:checked {
    z-index: 102;
  }

  #epw-${self.attr.key_}3:checked {
    z-index: 103;
  }

  #epw-${self.attr.key_}4:checked {
    z-index: 104;
  }

  #epw-${self.attr.key_}2:checked~#epw-${self.attr.key_}3 {
    z-index: 105;
  }

  #epw-${self.attr.key_}3:checked~#epw-${self.attr.key_}4 {
    z-index: 106;
  }


  #epw-${self.attr.key_}5 {
    z-index: 104;
  }

  #epw-${self.attr.key_}6 {
    z-index: 103;
  }

  #epw-${self.attr.key_}7 {
    z-index: 102;
  }

  #epw-${self.attr.key_}8 {
    z-index: 101;
  }

  #epw-${self.attr.key_}5:checked {
    z-index: 101;
  }

  #epw-${self.attr.key_}6:checked {
    z-index: 102;
  }

  #epw-${self.attr.key_}7:checked {
    z-index: 103;
  }

  #epw-${self.attr.key_}8:checked {
    z-index: 104;
  }

  #epw-${self.attr.key_}6:checked~#epw-${self.attr.key_}7 {
    z-index: 105;
  }

  #epw-${self.attr.key_}7:checked~#epw-${self.attr.key_}8 {
    z-index: 106;
  }
</style>
<%block name="options">
    <style>
        body {
            --epw-${self.attr.key_}: 1em;
            font-size: var(--epw-${self.attr.key_});
        }

        #epw-${self.attr.key_}1:checked~body {
            --epw-${self.attr.key_}: 1.1em;
        }

        #epw-${self.attr.key_}2:checked~body {
            --epw-${self.attr.key_}: 1em;
        }

        #epw-${self.attr.key_}3:checked~body {
            --epw-${self.attr.key_}: 0.9em;
        }

        #epw-${self.attr.key_}4:checked~body {
            --epw-${self.attr.key_}: 0.8em;
        }

        #epw-${self.attr.key_}5:checked~body {
            --epw-${self.attr.key_}: 1.13em;
        }

        #epw-${self.attr.key_}6:checked~body {
            --epw-${self.attr.key_}: 1.22em;
        }

        #epw-${self.attr.key_}7:checked~body {
            --epw-${self.attr.key_}: 1.33em;
        }

        #epw-${self.attr.key_}8:checked~body {
            --epw-${self.attr.key_}: 1.46em;
        }
    </style>
</%block>

<input class="epw-${self.attr.key_}-radio epw-${self.attr.key_}-minus" type="radio" id="epw-${self.attr.key_}1" name="epw-${self.attr.key_}"/>
<input class="epw-${self.attr.key_}-radio epw-${self.attr.key_}-default" type="radio" id="epw-${self.attr.key_}2" name="epw-${self.attr.key_}" checked=""/>
<input class="epw-${self.attr.key_}-radio epw-${self.attr.key_}-minus" type="radio" id="epw-${self.attr.key_}3" name="epw-${self.attr.key_}"/>
<input class="epw-${self.attr.key_}-radio epw-${self.attr.key_}-minus" type="radio" id="epw-${self.attr.key_}4" name="epw-${self.attr.key_}"/>

<input class="epw-${self.attr.key_}-radio epw-${self.attr.key_}-plus" type="radio" id="epw-${self.attr.key_}5" name="epw-${self.attr.key_}"/>
<input class="epw-${self.attr.key_}-radio epw-${self.attr.key_}-plus" type="radio" id="epw-${self.attr.key_}6" name="epw-${self.attr.key_}"/>
<input class="epw-${self.attr.key_}-radio epw-${self.attr.key_}-plus" type="radio" id="epw-${self.attr.key_}7" name="epw-${self.attr.key_}"/>
<input class="epw-${self.attr.key_}-radio epw-${self.attr.key_}-plus" type="radio" id="epw-${self.attr.key_}8" name="epw-${self.attr.key_}"/>

