// **********************************************************************
//
// Copyright (c) 2003-2013 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************
//
// Ice version 3.5.0
//
// <auto-generated>
//
// Generated from file `img_proc_server.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

package imgprocserver;

public final class ImgProcServerInterfacePrxHelper extends Ice.ObjectPrxHelperBase implements ImgProcServerInterfacePrx
{
    private static final String __doProcess_name = "doProcess";

    public java.util.Map<java.lang.String, java.lang.String> doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params)
    {
        return doProcess(img, params, null, false);
    }

    public java.util.Map<java.lang.String, java.lang.String> doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, java.util.Map<String, String> __ctx)
    {
        return doProcess(img, params, __ctx, true);
    }

    private java.util.Map<java.lang.String, java.lang.String> doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, java.util.Map<String, String> __ctx, boolean __explicitCtx)
    {
        if(__explicitCtx && __ctx == null)
        {
            __ctx = _emptyContext;
        }
        final Ice.Instrumentation.InvocationObserver __observer = IceInternal.ObserverHelper.get(this, "doProcess", __ctx);
        int __cnt = 0;
        try
        {
            while(true)
            {
                Ice._ObjectDel __delBase = null;
                try
                {
                    __checkTwowayOnly("doProcess");
                    __delBase = __getDelegate(false);
                    _ImgProcServerInterfaceDel __del = (_ImgProcServerInterfaceDel)__delBase;
                    return __del.doProcess(img, params, __ctx, __observer);
                }
                catch(IceInternal.LocalExceptionWrapper __ex)
                {
                    __handleExceptionWrapper(__delBase, __ex, __observer);
                }
                catch(Ice.LocalException __ex)
                {
                    __cnt = __handleException(__delBase, __ex, null, __cnt, __observer);
                }
            }
        }
        finally
        {
            if(__observer != null)
            {
                __observer.detach();
            }
        }
    }

    public Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params)
    {
        return begin_doProcess(img, params, null, false, null);
    }

    public Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, java.util.Map<String, String> __ctx)
    {
        return begin_doProcess(img, params, __ctx, true, null);
    }

    public Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, Ice.Callback __cb)
    {
        return begin_doProcess(img, params, null, false, __cb);
    }

    public Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, java.util.Map<String, String> __ctx, Ice.Callback __cb)
    {
        return begin_doProcess(img, params, __ctx, true, __cb);
    }

    public Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, Callback_ImgProcServerInterface_doProcess __cb)
    {
        return begin_doProcess(img, params, null, false, __cb);
    }

    public Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, java.util.Map<String, String> __ctx, Callback_ImgProcServerInterface_doProcess __cb)
    {
        return begin_doProcess(img, params, __ctx, true, __cb);
    }

    private Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, java.util.Map<String, String> __ctx, boolean __explicitCtx, IceInternal.CallbackBase __cb)
    {
        __checkAsyncTwowayOnly(__doProcess_name);
        IceInternal.OutgoingAsync __result = new IceInternal.OutgoingAsync(this, __doProcess_name, __cb);
        try
        {
            __result.__prepare(__doProcess_name, Ice.OperationMode.Normal, __ctx, __explicitCtx);
            IceInternal.BasicStream __os = __result.__startWriteParams(Ice.FormatType.DefaultFormat);
            ImageHelper.write(__os, img);
            ParametersHelper.write(__os, params);
            __result.__endWriteParams();
            __result.__send(true);
        }
        catch(Ice.LocalException __ex)
        {
            __result.__exceptionAsync(__ex);
        }
        return __result;
    }

    public java.util.Map<java.lang.String, java.lang.String> end_doProcess(Ice.AsyncResult __result)
    {
        Ice.AsyncResult.__check(__result, this, __doProcess_name);
        boolean __ok = __result.__wait();
        try
        {
            if(!__ok)
            {
                try
                {
                    __result.__throwUserException();
                }
                catch(Ice.UserException __ex)
                {
                    throw new Ice.UnknownUserException(__ex.ice_name(), __ex);
                }
            }
            IceInternal.BasicStream __is = __result.__startReadParams();
            java.util.Map<java.lang.String, java.lang.String> __ret;
            __ret = ReturnTypeHelper.read(__is);
            __result.__endReadParams();
            return __ret;
        }
        catch(Ice.LocalException ex)
        {
            Ice.Instrumentation.InvocationObserver __obsv = __result.__getObserver();
            if(__obsv != null)
            {
                __obsv.failed(ex.ice_name());
            }
            throw ex;
        }
    }

    public static ImgProcServerInterfacePrx checkedCast(Ice.ObjectPrx __obj)
    {
        ImgProcServerInterfacePrx __d = null;
        if(__obj != null)
        {
            if(__obj instanceof ImgProcServerInterfacePrx)
            {
                __d = (ImgProcServerInterfacePrx)__obj;
            }
            else
            {
                if(__obj.ice_isA(ice_staticId()))
                {
                    ImgProcServerInterfacePrxHelper __h = new ImgProcServerInterfacePrxHelper();
                    __h.__copyFrom(__obj);
                    __d = __h;
                }
            }
        }
        return __d;
    }

    public static ImgProcServerInterfacePrx checkedCast(Ice.ObjectPrx __obj, java.util.Map<String, String> __ctx)
    {
        ImgProcServerInterfacePrx __d = null;
        if(__obj != null)
        {
            if(__obj instanceof ImgProcServerInterfacePrx)
            {
                __d = (ImgProcServerInterfacePrx)__obj;
            }
            else
            {
                if(__obj.ice_isA(ice_staticId(), __ctx))
                {
                    ImgProcServerInterfacePrxHelper __h = new ImgProcServerInterfacePrxHelper();
                    __h.__copyFrom(__obj);
                    __d = __h;
                }
            }
        }
        return __d;
    }

    public static ImgProcServerInterfacePrx checkedCast(Ice.ObjectPrx __obj, String __facet)
    {
        ImgProcServerInterfacePrx __d = null;
        if(__obj != null)
        {
            Ice.ObjectPrx __bb = __obj.ice_facet(__facet);
            try
            {
                if(__bb.ice_isA(ice_staticId()))
                {
                    ImgProcServerInterfacePrxHelper __h = new ImgProcServerInterfacePrxHelper();
                    __h.__copyFrom(__bb);
                    __d = __h;
                }
            }
            catch(Ice.FacetNotExistException ex)
            {
            }
        }
        return __d;
    }

    public static ImgProcServerInterfacePrx checkedCast(Ice.ObjectPrx __obj, String __facet, java.util.Map<String, String> __ctx)
    {
        ImgProcServerInterfacePrx __d = null;
        if(__obj != null)
        {
            Ice.ObjectPrx __bb = __obj.ice_facet(__facet);
            try
            {
                if(__bb.ice_isA(ice_staticId(), __ctx))
                {
                    ImgProcServerInterfacePrxHelper __h = new ImgProcServerInterfacePrxHelper();
                    __h.__copyFrom(__bb);
                    __d = __h;
                }
            }
            catch(Ice.FacetNotExistException ex)
            {
            }
        }
        return __d;
    }

    public static ImgProcServerInterfacePrx uncheckedCast(Ice.ObjectPrx __obj)
    {
        ImgProcServerInterfacePrx __d = null;
        if(__obj != null)
        {
            if(__obj instanceof ImgProcServerInterfacePrx)
            {
                __d = (ImgProcServerInterfacePrx)__obj;
            }
            else
            {
                ImgProcServerInterfacePrxHelper __h = new ImgProcServerInterfacePrxHelper();
                __h.__copyFrom(__obj);
                __d = __h;
            }
        }
        return __d;
    }

    public static ImgProcServerInterfacePrx uncheckedCast(Ice.ObjectPrx __obj, String __facet)
    {
        ImgProcServerInterfacePrx __d = null;
        if(__obj != null)
        {
            Ice.ObjectPrx __bb = __obj.ice_facet(__facet);
            ImgProcServerInterfacePrxHelper __h = new ImgProcServerInterfacePrxHelper();
            __h.__copyFrom(__bb);
            __d = __h;
        }
        return __d;
    }

    public static final String[] __ids =
    {
        "::Ice::Object",
        "::cvhammer::ImgProcServerInterface"
    };

    public static String ice_staticId()
    {
        return __ids[1];
    }

    protected Ice._ObjectDelM __createDelegateM()
    {
        return new _ImgProcServerInterfaceDelM();
    }

    protected Ice._ObjectDelD __createDelegateD()
    {
        return new _ImgProcServerInterfaceDelD();
    }

    public static void __write(IceInternal.BasicStream __os, ImgProcServerInterfacePrx v)
    {
        __os.writeProxy(v);
    }

    public static ImgProcServerInterfacePrx __read(IceInternal.BasicStream __is)
    {
        Ice.ObjectPrx proxy = __is.readProxy();
        if(proxy != null)
        {
            ImgProcServerInterfacePrxHelper result = new ImgProcServerInterfacePrxHelper();
            result.__copyFrom(proxy);
            return result;
        }
        return null;
    }

    public static final long serialVersionUID = 0L;
}
