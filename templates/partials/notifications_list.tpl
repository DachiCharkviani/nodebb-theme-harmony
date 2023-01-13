{{{ if !notifications.length }}}
<li class="no-notifs text-center p-2">[[notifications:no_notifs]]</li>
{{{ end }}}

{{{ each notifications }}}
<li class="{./readClass} mb-2 p-1" data-nid="{./nid}" data-path="{./path}" {{{ if ./pid }}}data-pid="{./pid}"{{{ end }}}{{{ if ./tid }}}data-tid="{./tid}"{{{ end }}}>
	<div class="d-flex gap-1 justify-content-between">
		<div class="d-flex gap-2">
			{{{ if ./image }}}
			{{{ if ./from }}}
			<a class="text-decoration-none" href="{config.relative_path}/user/{./user.userslug}"><img class="avatar avatar-rounded" style="--avatar-size: 32px;" src="{./image}" /></a>
			{{{ end }}}
			{{{ else }}}
			<a class="text-decoration-none"  href="{config.relative_path}/user/{./user.userslug}"><div class="avatar avatar-rounded" style="--avatar-size: 32px; background-color: {./user.icon:bgColor};">{./user.icon:text}</div></a>
			{{{ end }}}
			<div class=" d-flex flex-column">
				<a href="{./path}" class="text-decoration-none notification-chat-content text-reset text text-sm">
					{./bodyShort}
				</a>
				<div class="text-xs text-muted">{./timeagoLong}</div>
			</div>
		</div>
		<div class="notification-chat-controls">
			{{{ if ./nid }}}
			<button class="mark-read btn btn-light btn-sm" aria-label="Mark Read">
				<i class="unread fa fa-xs fa-circle text-primary {{{ if ./read }}}hidden{{{ end }}}"></i>
				<i class="read fa fa-xs fa-circle-o text-secondary {{{ if !./read }}}hidden{{{ end }}}"></i>
			</button>
			{{{ end }}}
		</div>
	</div>
</li>
{{{end}}}
