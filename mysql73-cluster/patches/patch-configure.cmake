$NetBSD$

Explicitly disable epoll on SunOS.

--- configure.cmake.orig	2014-07-02 09:22:14.000000000 +0000
+++ configure.cmake
@@ -349,7 +349,9 @@ CHECK_INCLUDE_FILES (sasl/sasl.h HAVE_SA
 CHECK_INCLUDE_FILES(sys/devpoll.h HAVE_DEVPOLL)
 CHECK_INCLUDE_FILES(signal.h HAVE_SIGNAL_H)
 CHECK_INCLUDE_FILES(sys/devpoll.h HAVE_SYS_DEVPOLL_H)
+IF(NOT CMAKE_SYSTEM_NAME MATCHES "SunOS")
 CHECK_INCLUDE_FILES(sys/epoll.h HAVE_SYS_EPOLL_H)
+ENDIF()
 CHECK_INCLUDE_FILES(sys/event.h HAVE_SYS_EVENT_H)
 CHECK_INCLUDE_FILES(sys/queue.h HAVE_SYS_QUEUE_H)
 CHECK_SYMBOL_EXISTS (TAILQ_FOREACH "sys/queue.h" HAVE_TAILQFOREACH)
@@ -550,8 +552,10 @@ CHECK_FUNCTION_EXISTS (nl_langinfo HAVE_
 CHECK_FUNCTION_EXISTS (ntohll HAVE_HTONLL)
 
 CHECK_FUNCTION_EXISTS (clock_gettime DNS_USE_CPU_CLOCK_FOR_ID)
+IF(NOT CMAKE_SYSTEM_NAME MATCHES "SunOS")
 CHECK_FUNCTION_EXISTS (epoll_create HAVE_EPOLL)
 CHECK_FUNCTION_EXISTS (epoll_ctl HAVE_EPOLL_CTL)
+ENDIF()
 # Temperarily  Quote event port out as we encounter error in port_getn
 # on solaris x86
 # CHECK_FUNCTION_EXISTS (port_create HAVE_EVENT_PORTS)
