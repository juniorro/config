local jdtls = pcall(require, "jdtls")
if not jdtls then
	return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = "/home/junior/Software/" .. project_name
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	return
end

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:/home/junior/eclipse.jdt.ls/org.eclipse.jdt.ls.tests/lib/lombok-1.18.24.jar",
		"-jar",
		"/home/junior/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
		"/home/junior/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux",
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
	settings = {
		java = {},
	},
	init_options = {
		bundles = {},
	},
}

config["on_attach"] = function(client, bufnr)
	require("jdtls").on_attach({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		floating_window_above_cur_line = false,
		padding = "",
		handler_opts = {
			border = "rounded",
		},
	}, bufnr)
end

require("jdtls").start_or_attach(config)
require("jdtls.setup").add_commands()
