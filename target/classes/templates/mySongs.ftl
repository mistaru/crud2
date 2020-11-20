<#import "parts/common.ftl" as c>

<@c.page>

    <div class="list-group">
        <#if MySong??>
            <#list MySong as MySong>
                <div class="m-3">
                     <b>${MySong.name}</b>
                    <span>${MySong.singer}|</span>
                    <span>${MySong.album}|</span>
                    <span>${MySong.style}</span>
                </div>
                <#else>
                    No message
            </#list>
        </#if>
    </div>


    </@c.page>

