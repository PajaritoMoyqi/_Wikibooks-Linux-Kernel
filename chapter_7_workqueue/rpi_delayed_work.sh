#!/bin/bash

echo 0 > /sys/kernel/debug/tracing/tracing_on
sleep 1
echo "tracing_off" 

echo 0 > /sys/kernel/debug/tracing/events/enable
sleep 1
echo "events disabled"

echo  secondary_start_kernel  > /sys/kernel/debug/tracing/set_ftrace_filter	
sleep 1
echo "set_ftrace_filter init"

echo function > /sys/kernel/debug/tracing/current_tracer
sleep 1
echo "function tracer enabled"

echo 1 > /sys/kernel/debug/tracing/events/sched/sched_switch/enable
echo 1 > /sys/kernel/debug/tracing/events/sched/sched_wakeup/enable

echo 1 > /sys/kernel/debug/tracing/events/workqueue/workqueue_activate_work/enable
echo 1 > /sys/kernel/debug/tracing/events/workqueue/workqueue_queue_work/enable
echo 1 > /sys/kernel/debug/tracing/events/workqueue/workqueue_execute_start/enable
echo 1 > /sys/kernel/debug/tracing/events/workqueue/workqueue_execute_end/enable

echo 1 > /sys/kernel/debug/tracing/events/timer/timer_init/enable
echo 1 > /sys/kernel/debug/tracing/events/timer/timer_start/enable
echo 1 > /sys/kernel/debug/tracing/events/timer/timer_expire_exit/enable
echo 1 > /sys/kernel/debug/tracing/events/timer/timer_cancel/enable
echo 1 > /sys/kernel/debug/tracing/events/timer/timer_expire_entry/enable
sleep 1
echo "event enabled"

echo insert_work bcm2835_mbox_work_callback > /sys/kernel/debug/tracing/set_ftrace_filter
echo bcm2835_mbox_delayed_work_callback >> /sys/kernel/debug/tracing/set_ftrace_filter
sleep 1
echo "set_ftrace_filter enabled"

echo 1 > /sys/kernel/debug/tracing/options/func_stack_trace
echo "function stack trace enable"

echo 1 > /sys/kernel/debug/tracing/tracing_on
echo "tracing_on"
