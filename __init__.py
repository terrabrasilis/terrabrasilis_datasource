# -*- coding: utf-8 -*-
"""
/***************************************************************************
 TerraBrasilisDataSource
                                 A QGIS plugin
 The plugin enable to show layers from TerraBrasilis Geoserver
 Generated by Plugin Builder: http://g-sherman.github.io/Qgis-Plugin-Builder/
                             -------------------
        begin                : 2020-11-25
        copyright            : (C) 2020 by Adeline Maciel
        email                : adelinemaciel22@gmail.com
        git sha              : $Format:%H$
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
 This script initializes the plugin, making it known to QGIS.
"""


# noinspection PyPep8Naming
def classFactory(iface):  # pylint: disable=invalid-name
    """Load TerraBrasilisDataSource class from file TerraBrasilisDataSource.

    :param iface: A QGIS interface instance.
    :type iface: QgsInterface
    """
    #
    from .terrabrasilis_datasource import TerraBrasilisDataSource
    return TerraBrasilisDataSource(iface)
