#pragma once

#include <gtk/gtk.h>

struct Window {
	GdkMonitor *monitor;

	GtkWidget *window;
	GtkWidget *overlay;
	GtkWidget *window_box;
	GtkWidget *body_revealer;
	GtkWidget *body_grid;
	GtkWidget *input_label;
	GtkWidget *input_field;
	GtkWidget *message_box;
	GtkWidget *unlock_button;
	GtkWidget *error_label;
	GtkWidget *warning_label;
	GtkWidget *clock_label;

	gulong enter_notify_handler;

	void *module_data[];
};

struct GtkLock {
	GtkApplication *app;
	GArray *windows;
	GArray *messages;
	GArray *errors;

	struct Window *focused_window;
	gboolean hidden;
	guint idle_timeout;

	guint draw_clock_source;
	guint idle_hide_source;

	gboolean use_layer_shell;
	gboolean use_input_inhibit;
	gboolean use_idle_hide;
};
