<#import "parts/common.ftl" as c>
<@c.page>
    <h3 align="center" style="color:Black">All songs</h3>

    <div class="container text-center text-black">
        <form method="post" action="/song/find/list1">
            <div class="row">
                <div class="col-auto">
                    <input type="text" name="name" class="form-control" placeholder="name"/>
                </div>
                <div class="col-auto">
                    <input type="text" name="singer" class="form-control" placeholder="author"/>
                </div>
                <div class="col-auto">
                    <input type="text" name="album" class="form-control" placeholder="album"/>
                </div>
                <div class="col-auto">
                    <input type="text" name="style" class="form-control" placeholder="style"/>
                </div>

                <div class="col-auto">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button class="btn btn-primary" type="submit">Search</button>
                </div>
            </div>
        </form>
    </div>

    <div class="container py-5">
        <div class="row">
            <div class="col-lg-7 mx-auto bg-white rounded shadow">
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