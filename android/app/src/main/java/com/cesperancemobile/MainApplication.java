package com.cesperancemobile;

import com.AlexanderZaytsev.RNI18n.RNI18nPackage;
import com.BV.LinearGradient.LinearGradientPackage;
import com.facebook.react.ReactPackage;
import com.oblador.vectoricons.VectorIconsPackage;
import com.reactnativenavigation.NavigationApplication;

import java.util.Arrays;
import java.util.List;


public class MainApplication extends NavigationApplication {

    @Override
    public boolean isDebug() {
        return BuildConfig.DEBUG;
    }


    protected List<ReactPackage> getPackages() {
        long size = 50L * 1024L * 1024L; // 50 MB 
com.facebook.react.modules.storage.ReactDatabaseSupplier.getInstance(getApplicationContext()).setMaximumSize(size);
        return Arrays.<ReactPackage>asList(
                new RNI18nPackage(),
                new RNSqlite2Package(),
                new VectorIconsPackage(),
                new LinearGradientPackage()
        );
    }

    @Override
    public List<ReactPackage> createAdditionalReactPackages() {
        return getPackages();
    }
    @Override
    public String getJSMainModuleName() {
        return "index";
    }
}
