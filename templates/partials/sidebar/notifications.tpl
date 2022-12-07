<a data-bs-toggle="dropdown" href="#" role="button" class="nav-link nav-btn position-relative" title="[[global:header.notifications]]">
	<span class="d-inline-flex justify-content-between w-100">
		<span class="text-nowrap truncate-open">
			<span class="position-relative">
				<i component="notifications/icon" class="fa fa-fw {{{ if unreadCount.notification}}}fa-bell{{{ else }}}fa-bell-o{{{ end }}} unread-count" data-content="{unreadCount.notification}"></i>
				<span component="notifications/count" class="visible-closed position-absolute top-0 start-100 translate-middle badge rounded-1 bg-primary {{{ if !unreadCount.notification }}}hidden{{{ end }}}">{unreadCount.notification}</span>
			</span>
			<span class="nav-text visible-open px-2 fw-semibold">[[global:header.notifications]]</span>
		</span>
		<span component="notifications/count" class="visible-open badge rounded-1 bg-primary {{{ if !unreadCount.notification }}}hidden{{{ end }}}">{unreadCount.notification}</span>
	</span>
</a>
<ul class="notifications-dropdown dropdown-menu p-2 shadow">
	<li>
		<ul component="notifications/list" class="notification-list list-unstyled p-2">
			<li class="loading-text text-center">
				<a href="#" class="text-reset"><i class="fa fa-refresh fa-spin"></i> [[global:notifications.loading]]</a>
			</li>
		</ul>
	</li>
	<li class="dropdown-divider"></li>
	<li class="notif-dropdown-link">
		<div class="d-flex justify-content-center gap-1 flex-nowrap">
			<a role="button" href="#" class="btn btn-sm btn-light mark-all-read flex-fill text-nowrap ff-secondary"><i class="fa fa-check-double"></i> [[notifications:mark_all_read]]</a>
			<a class="btn btn-sm btn-primary flex-fill text-nowrap ff-secondary" href="{relative_path}/notifications"><i class="fa fa-list"></i> [[notifications:see_all]]</a>
		</div>
	</li>
</ul>
