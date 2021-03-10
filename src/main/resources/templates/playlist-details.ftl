<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<@c.page>
    <input type="hidden" value="${playlist.id}" name="id">

    <h3 align="center" style="color:Black">Detail: ${playlist.name}</h3>

    <#if !isAdmin>
    <div class="container text-center text-black">
            <form method="post" action="/playlist/addSongs/${playlist.id}">
                <input type="hidden" value="${playlist.id}" name="id">
                <div class="row">
                    <div>
                        <select name="nameSong" class="selectpicker">
                            <option selected="selected">Select</option>
                            <#list Songs as s>
                                <option>${s.name}</option>
                            </#list>
                        </select>
                    </div>

                    <div class="col-auto">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-primary btn-sm">Add</button>
                    </div>
                </div>
            </form>
    </div>
    </#if>

    <div class="container py-5">
        <div class="row">
            <div class="col-lg-9 mx-auto bg-white rounded shadow">
                <div class="table-responsive">
                    <table class="table table-fixed">
                        <thead>
                        <tr>
                            <th scope="col" class="col-3">Name</th>
                            <th scope="col" class="col-3">Author</th>
                            <th scope="col" class="col-3">Album</th>
                            <th scope="col" class="col-3">Style</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if Song??>
                            <#list Song as Song>
                                <tr>
                                    <td class="col-3">${Song.name}</td>
                                    <td class="col-3">${Song.singer}</td>
                                    <td class="col-3">${Song.album}</td>
                                    <td class="col-3">${Song.style}</td>
                                </tr>
                            <#else>
                                List is empty!
                            </#list>
                        </#if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</@c.page>