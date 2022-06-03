scopes = request.http_request.POST.get("scope", "").split()
access = []
for scope in scopes:
    if scope.count(":") < 2:
        continue
    type, name, actions = scope.split(":")
    if not ak_is_group_member(user, name="acl_docker_push"):
        actions = "pull"
    access.append(
        {
            "type": type,
            "name": name,
            "actions": actions.split(","),
        }
    )
return {
    "access": access,
}
