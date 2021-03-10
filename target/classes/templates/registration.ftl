<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <h3>Registration</h3>
    ${message?ifExists}
    <@l.login "/registration" true />
</@c.page>
