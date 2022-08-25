// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.


//Macros to enable or disable a code section that may or maynot conflict with this test.
#define SET_DISPATCH 1
#define SET_PAGE_CODE 1


_Dispatch_type_(IRP_MJ_CLEANUP) 
DRIVER_DISPATCH DispatchCleanup;

_Dispatch_type_(IRP_MJ_SHUTDOWN)
DRIVER_DISPATCH DispatchShutdown;

#ifndef __cplusplus
#pragma alloc_text (PAGE, DispatchCleanup)
#pragma alloc_text (PAGE, DispatchShutdown)
#endif


//Template
void top_level_call(){
}

//Passes
NTSTATUS
DispatchCleanup (
    PDEVICE_OBJECT DriverObject,
    PIRP Irp
    )
{
    UNREFERENCED_PARAMETER(DriverObject);
    UNREFERENCED_PARAMETER(Irp);
    PAGED_CODE();
    
    return STATUS_SUCCESS;
}

//Fails
NTSTATUS
DispatchShutdown (
    PDEVICE_OBJECT DriverObject,
    PIRP Irp
    )
{
    UNREFERENCED_PARAMETER(DriverObject);
    UNREFERENCED_PARAMETER(Irp);
    PAGED_CODE();
    PAGED_CODE();
    
    return STATUS_SUCCESS;
}





