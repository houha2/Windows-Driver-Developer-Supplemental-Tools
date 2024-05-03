// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.
/**
 * @name Connect Redirect Inline Callout cannot set reauth
 * @description Checks that an Inline Connect Redirect Callout does not ask for reauthorization
 * @platform Desktop
 * @feature.area Multiple
 * @repro.text The following function asks for reauthorization and is an inline callout this is a contract violation
 * @kind problem
 * @id cpp/windows/drivers/kmdf/queries/wfp/InlineConnectRedirect
 * @problem.severity warning
 * @precision medium
 * @tags correctness
 * @query-version v1
 */

 import cpp
 import drivers.libraries.wfp

// Contract
// Inline callout shouldn’t ask for re-authorization i.e., 
// shouldn’t set FWPS_CLASSIFY_FLAG_REAUTHORIZE_IF_MODIFIED_BY_OTHERS

// Returns TRUE if the callout function is a inline callout in 
// the connect redirect layers and sets the 
// FWPS_CLASSIFY_FLAG_REAUTHORIZE_IF_MODIFIED_BY_OTHERS flag

class ConnectRedirectClassifyFunction extends Function {
    WfpConnectRedirectInline scr;
    ConnectRedirectClassifyFunction() { this.getADeclarationEntry() = src.getADeclarationEntry}
}


from ConnectRedirectClassifyFunction waf
where
    exists(ClassifyReauthorizeFlag flag)
select waf,
"A connect redirect callout " + waf.getName() + " is marked inline and sets FWPS_CLASSIFY_FLAG_REAUTHORIZE_IF_MODIFIED_BY_OTHERS. This is a contract violation."