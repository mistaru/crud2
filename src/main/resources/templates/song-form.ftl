<#import "parts/common.ftl" as c>
<@c.page>

    <form action="/song/new" method="post">
        <input type="hidden" value="${song.id}" name="id">

        <h3 align="center" style="color:Black">Edit: ${song.name}</h3>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="title" class="cols-sm-2 control-label">Name</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <input type="text" name="name" class="form-control" placeholder="name"
                                               value="${song.name}"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description" class="cols-sm-2 control-label">Singer</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <input type="text" name="singer" class="form-control"
                                               placeholder="singer" value="${song.singer}"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description" class="cols-sm-2 control-label">Album</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <input type="text" name="album" class="form-control"
                                               placeholder="album" value="${song.album}"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description" class="cols-sm-2 control-label">Style</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <input type="text" name="style" class="form-control"
                                               placeholder="жанр" value="${song.style}"/>
                                    </div>
                                </div>
                            </div>

                            <div align="center">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <#if exists??>
        ${exists}
    </#if>
</@c.page>