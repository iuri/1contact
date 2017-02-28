<master>
  <property name="doc(title)">@title;noquote@</property>
  <property name="context">@context;noquote@</property>
  <property name="signatory">@ec_system_owner;noquote@</property>

  <property name="current_location">gift-certificate</property>

<include src="/packages/ecommerce/lib/toolbar">
<include src="/packages/ecommerce/lib/searchbar">

<blockquote>
  <p>The perfect gift for anyone, gift certificates can be used to buy
    anything at @system_name@!</p>
  <p><a href="@order_url@">Order a Gift Certificate!</a></p>
  <p><b>About Gift Certificates</b></p>
  <ul>
    <li>
      Gift certificates are sent to the recipient via email shortly
      after you place your order.
    </li>
    <li>
      Any unused balance will be put in the recipient's gift
      certificate account.
    </li>
    <li>
      Gift certificates expire @expiration_time@ from date of
      purchase.
    </li>
    <li>
      You can purchase a gift certificate for any amount between
      @minimum_amount@ and @maximum_amount@.
    </li>
  </ul>
</blockquote>
