{{ js('jssocials-1.4.0/jssocials.min.js') }}
{{ css('jssocials-1.4.0/jssocials.css') }}
{{ css('jssocials-1.4.0/jssocials-theme-flat.css') }}

<div class="socials-share-btn">></div>
<script>
  if ($) {
    $(document).ready(function(){
      $(".socials-share-btn").jsSocials({
        shares: ["email", "twitter", "facebook", "googleplus", "linkedin", "pinterest", "stumbleupon", "whatsapp"]
      });
    })
  }
</script>
