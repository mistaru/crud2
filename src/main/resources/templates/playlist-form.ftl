<#import "parts/common.ftl" as c>
<@c.page>

    <form action="/playlist/add" method="post">
        <input type="hidden" value="${playlist.id}" name="id">

        <h3 align="center" style="color:Black">Редактировать: ${playlist.name}</h3>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="title" class="cols-sm-2 control-label">Название</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <input type="text" name="name" class="form-control" placeholder="название"
                                               value="${playlist.name}"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description" class="cols-sm-2 control-label">Описание</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <input type="text" name="singer" class="form-control"
                                               placeholder="исполнитель" value="${playlist.description}"/>
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

</@c.page>